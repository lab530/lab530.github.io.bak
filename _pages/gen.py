import os
import uuid

for i in range(1000):
    os.system('cp 1.html {}.html'.format(uuid.uuid4().hex))

