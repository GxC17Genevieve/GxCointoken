from django.conf import settings

import datetime
import time
from redis import Redis

from django_rq import job
import django_rq
from rq import Queue, Connection, Worker
from rq.job import Job


redis_conn = Redis()
