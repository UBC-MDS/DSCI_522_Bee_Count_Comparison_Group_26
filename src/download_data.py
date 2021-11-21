# author: Simon Guo
# date: 2021-11-21
# modify based on the script by Tiffany Timbers
# date: 2019-12-18
# source: https://github.com/ttimbers/breast_cancer_predictor/blob/v1.1/src/download_data.py

"""Downloads csv data from the web to a local filepath as either a csv file format.
It would use the default url and output a csv file in the current working directory by default

Usage: src/download_data.py [--url=<url>] [--out_file=<out_file>]

Options:
[--url=<url>]              URL from where to download the data (must be in standard csv format)
[--out_file=<out_file>]    Path (including filename) of where to locally write the file
"""
  
from docopt import docopt
import requests
import os
import pandas as pd

opt = docopt(__doc__)

if opt["--url"] is None:
  opt["--url"] = "https://files.ontario.ca/moe_mapping/downloads/4Other/PHAP/Bumble_Bee_Public_Data.csv"
if opt["--out_file"] is None:
  opt["--out_file"] = "../data/Bumble_Bee_Public_Data.csv"

def main(url, out_file):
  try: 
    request = requests.get(url)
    request.status_code == 200
  except Exception as req:
    print("Website at the provided url does not exist.")
    print(req)
    
  data = pd.read_csv(url, header=None)
  

  try:
    data.to_csv(out_file, index = False)
  except:
    os.makedirs(os.path.dirname(out_file))
    data.to_csv(out_file, index = False)

if __name__ == "__main__":
  main(opt["--url"], opt["--out_file"])