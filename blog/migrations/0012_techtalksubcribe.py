# Generated by Django 4.0.3 on 2022-04-13 17:25

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('blog', '0011_post_views'),
    ]

    operations = [
        migrations.CreateModel(
            name='TechtalkSubcribe',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subcribe_techtalks', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='subcribetechtalk', to='blog.techtalk')),
                ('subcribe_users', models.ManyToManyField(to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]