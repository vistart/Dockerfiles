import requests
import sys

def download_file_from_google_drive(id, destination):
    URL = "https://docs.google.com/uc?export=download"

    session = requests.Session()

    response = session.get(URL, params = { 'id' : id }, stream = True)
    token = get_confirm_token(response)

    print("Token: %s" % token)

    if token:
        params = { 'id' : id, 'confirm' : token }
        response = session.get(URL, params = params, stream = True)

    save_response_content(response, destination)    

def get_confirm_token(response):
    for key, value in response.cookies.items():
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
