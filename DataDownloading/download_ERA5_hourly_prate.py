from queue import Queue
from threading import Thread
import cdsapi
from time import time
import datetime
import os

def downloadonefile(riqi):
    ts = time()
    filename="/neelin2020/ERA-5_uv/omega/era-5_prate_"+riqi+".nc"
    if(os.path.isfile(filename)): #print and return if the file exist
      print("ok",filename)
    else:
      print(filename)
      c = cdsapi.Client()
      c.retrieve(
          'reanalysis-era5-single-levels',
          {
              'product_type' : 'reanalysis',
              'format'       : 'netcdf', # Supported format: grib and netcdf. Default: grib
              'variable': [
                  'convective_rain_rate', 'large_scale_rain_rate',
               ],
              'year'         : riqi[0:4],
              'month'        : riqi[-4:-2],
              'day'          : riqi[-2:],
              'time': [
                        '00:00', '01:00', '02:00',
                        '03:00', '04:00', '05:00',
                        '06:00', '07:00', '08:00',
                        '09:00', '10:00', '11:00',
                        '12:00', '13:00', '14:00',
                        '15:00', '16:00', '17:00',
                        '18:00', '19:00', '20:00',
                        '21:00', '22:00', '23:00',
               ],
              'area'         : [
                         26, -180, -26, 180,
               ], # North, West, South, East. Default: global
##              'grid'         : [1.0, 1.0], # Latitude/longitude grid: east-west (longitude) and north-south resolution (latitude). Default: 0.25 x 0.25
          },
          filename)

    
#Create the threading class 
class DownloadWorker(Thread):
   def __init__(self, queue):
       Thread.__init__(self)
       self.queue = queue
 
   def run(self):
       while True:
           # get the year+month list from the queue 
           riqi = self.queue.get()
           downloadonefile(riqi)
           self.queue.task_done()

#Main program 
def main():
   #start the stopwatch
   ts = time()

   #choose your start and end date
   begin = datetime.date(2001,1,1)
   end = datetime.date(2001,12,31)
   d=begin
   delta = datetime.timedelta(days=1)
   
   #get the list of months or days
   links = []
   while d <= end:
       riqi=d.strftime("%Y%m%d")
       links.append(str(riqi))
       d += delta

   #Create a queue
   queue = Queue()

   # 20191119 CDS new limits https://cds.climate.copernicus.eu/live/limits
   # each account can only submit 4 downloading requests https://cds.climate.copernicus.eu/vision
   # Therefore, we create only 4 threads
   for x in range(4):
       worker = DownloadWorker(queue)
       worker.daemon = True
       worker.start()
       
   #put jobs into queue
   for link in links:
       queue.put((link))

   #wait for all jobs to be done
   queue.join()
   print('Took {}'.format(time() - ts))

if __name__ == '__main__':
   main()
