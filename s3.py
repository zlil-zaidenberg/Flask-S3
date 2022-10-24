import boto3,botocore 
from errors import *
import s3transfer

def Download_file(id,key,file):
    s3 = boto3.resource(
        service_name='s3',
        region_name='us-east-2',
        aws_access_key_id=id,
        aws_secret_access_key=key

    )
    # select bucket
    my_bucket = s3.Bucket('dcdevopstask')
    # download file into current directory
    for s3_object in my_bucket.objects.all():
        filename = s3_object.key
        if file in filename:
            full_path = filename
    try:
        s3.Bucket('dcdevopstask').download_file(full_path, file)
        print("{} downloaded".format(full_path))
    except:
        raise FileNotExist("the file not exist")
