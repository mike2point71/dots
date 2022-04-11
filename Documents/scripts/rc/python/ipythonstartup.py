#! /opt/homebrew/bin/python3
import os
import json
from tkinter import Tk     # from tkinter import Tk for Python 3.x
from tkinter.filedialog import askopenfilename, asksaveasfilename

d=None

def pwd():
    return os.getcwd()


def lj():
    j=None
    Tk().withdraw()  # we don't want a full GUI, so keep the root window from appearing
    # show an "Open" dialog box and return the path to the selected file
    filename = askopenfilename(initialdir=pwd())
    with open(filename, 'r') as f:
        j = json.load(f)
    return j

def sj(j):
    filename = asksaveasfilename(initialdir=pwd())
    with open(filename, 'w') as f:
        f.write(json.dumps(j, indent=2))


def sel():
    global d
    from selenium import webdriver
    from selenium.webdriver.chrome.options import Options

    options = Options()
    options.add_argument("--window-size=1920x1080")
    options.add_argument("--verbose")
    # options.add_argument("--headless")

    d = webdriver.Chrome(options=options)
    d.get("https://www.google.com")

print("Mike's meta utilities think they loaded.")
