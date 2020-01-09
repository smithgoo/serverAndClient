import  re
import requests
from bs4 import BeautifulSoup

BASE_URL = 'https://www.qb5.tw'
BASE_FIRST_URL = 'https://www.qb5.tw/shu/518.html'
LOCAL_SAVE_PATH = ''
user_agent = 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36'
headers = { 'User-Agent' : user_agent }

def getStoryList(url):
    response = requests.get(url=url,headers=headers)
    response.encoding = 'gbk'
    soup = BeautifulSoup(response.text)
    # print(soup.find_all('dd',attrs={'class':'clear'}))
    i = 1
    for v in soup.find_all('dd'):
        v = v.find_all('a')[0]
        storyUrl =BASE_URL + v['href']
        storyName = str(i)+v.string
        storySaveMethod(storyUrl,storyName)
        i+=1

def storySaveMethod(url,name):
    response = requests.get(url=url,headers=headers)
    response.encoding = 'gbk'
    soup = BeautifulSoup(response.text)
    x = soup.find('div',attrs={"id":"content"}).get_text()
    file = open(LOCAL_SAVE_PATH+name+'.text','w')
    file.write(x)
    file.close()

if __name__ == '__main__':
    getStoryList(BASE_FIRST_URL)