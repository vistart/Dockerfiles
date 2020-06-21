import requests
import sys

def download_file_from_google_drive(id, destination):
    URL = "https://docs.google.com/uc?export=download"

    session = requests.Session()
    headers = { 
        'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36',
        'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
        'accept-language': 'zh-CN,zh;q=0.9,en;q=0.8',
        'accept-encoding': 'gzip, deflate, br',
        'cache-control': 'max-age=0'
    }
    response = session.get(URL, params = { 'id' : id }, headers = headers, stream = True)
    token = get_confirm_token(response)

    print("Token: %s" % token)

    if token:
        params = { 'id' : id, 'confirm' : token }
        response = session.get(URL, params = params, stream = True)

    save_response_content(response, destination)    

def get_confirm_token(response):
    for key, value in response.cookies.items():
        print("Key: %s, Value: %s" % (key, value))
        if key.startswith('download_warning'):
            return value

    return None

def save_response_content(response, destination):
    CHUNK_SIZE = 32768

    count = 0
    with open(destination, "wb") as f:
        for chunk in response.iter_content(CHUNK_SIZE):
            if chunk: # filter out keep-alive new chunks
                count = count + f.write(chunk)
    print("Downloaded: %10.2f MB" % (count / 1048576))

def resolve_arguments():
    file_id = ''
    destination = '.'
    if (len(sys.argv) <= 1):
        raise RuntimeError('You must specify at least one parameter, which is the Google Drive File ID.')
    if (len(sys.argv) >= 2):
        file_id = sys.argv[1]
    if (len(sys.argv) >= 3):
        destination = sys.argv[2]
    return file_id, destination


if __name__ == "__main__":
    file_id, destination = resolve_arguments()
    print("File ID: %s, Destination: %s" % (file_id, destination))
    download_file_from_google_drive(file_id, destination)
