from django.db import models

class Screen (models.Model):
    bno = models.AutoField(primary_key=True)
    btitle = models.CharField(max_length=1000)
    bcontent = models.TextField()
    bgenre = models.CharField(max_length=100)
    bdirector = models.CharField(max_length=100)
    bactor = models.CharField(max_length=100)
    bfile = models.ImageField(blank=True,upload_to='board')

    def __str__(self):
        return f'{self.bno},{self.btitle},{self.bcontent},{self.bgenre},{self.bdirector},{self.bactor},{self.bfile}'
