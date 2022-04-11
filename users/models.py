
from PIL import Image
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.ImageField(default = 'default.jpg', upload_to='profile_pics')
    created_time = models.DateTimeField(default = timezone.now)
    is_admin = models.BooleanField(default = False)
    is_verified = models.BooleanField(default = False)


    def __str__(self):
        return f'{self.user.username} Profile'

    def save(self,*args, **kwargs):
        super(Profile, self).save(*args, **kwargs)

        img = Image.open(self.image.path)

        if img.height > 300 or img.width >300:
            output_size = (300,300)
            img.thumbnail(output_size)
            img.save(self.image.path)



