from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import Select, WebDriverWait
from selenium.webdriver.common.by import By
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

from selenium.webdriver.chrome.options import Options
import os, sys, time

file = open("courseCodes.txt", "r")
output = open("allCourses.txt", "w")
lines = file.readlines()
lines.sort()
codes = {}

for i, line in enumerate(lines):
    elems = line.strip().split('-')
    codes[elems[0]] = elems[2]

def findDriverPath():
# Locate proper chromedriver for your system and remove apple quarantine on it
    driverPath = os.path.join(os.path.dirname(__file__), "chromedriver")
    return driverPath

def resource_path(relative_path: str) -> str:
        try:
            base_path = sys._MEIPASS

        except Exception:
            base_path = os.path.dirname(__file__)

        return os.path.join(base_path, relative_path)

caps = DesiredCapabilities().CHROME
caps["pageLoadStrategy"] = "eager"
options = Options()
options.add_experimental_option("detach", True)
path = findDriverPath()
browser = webdriver.Chrome(service=Service(resource_path(path)), desired_capabilities=caps, options=options)

courses = dict()
linestowrite = ""

for code, faculty in codes.items():
    browser.get("https://suis.sabanciuniv.edu/prod/bwckctlg.p_disp_dyn_ctlg")

    WebDriverWait(browser, 20).until(EC.presence_of_element_located((By.ID, 'term_input_id')))
    termDropdown = Select(browser.find_element(By.ID, 'term_input_id'))
    termDropdown.select_by_value('202201')
    WebDriverWait(browser, 20).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[3]/form/input[2]'))).click()

    WebDriverWait(browser, 20).until(EC.presence_of_element_located((By.ID, 'subj_id')))
    subjDropdown = Select(browser.find_element(By.ID, 'subj_id'))
    subjDropdown.select_by_value(code)
    WebDriverWait(browser, 20).until(EC.presence_of_element_located((By.XPATH, '/html/body/div[3]/form/table/tbody/tr[5]/td[1]/input'))).click()

    table = browser.find_element(By.CSS_SELECTOR, "table.datadisplaytable")
    for i, row in enumerate(table.find_elements(By.CSS_SELECTOR, "tr")):
        if i % 2 == 0:
            for col in row.find_elements(By.CSS_SELECTOR, "td"):
                if col.text.split('-')[0].strip()[-1].isalpha() == False:
                    print("*"+col.text.split('-')[0].strip()+ "-" + faculty+"*")
                    linestowrite += col.text + "-" + faculty +'\n'


output.writelines(linestowrite)


