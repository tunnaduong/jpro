from msilib.schema import ListView
from turtle import mode
from django.shortcuts import (
    render, 
    redirect
)
from django.http import (
    HttpRequest,
    HttpResponse
)

from blog.models import Post
from .filters import BlogFilter
# Create your views here.

def home_views(request):
    context = ()
    
    post_list = Post.objects.all()
    popular_posts = Post.objects.filter(is_published=True).order_by('-blog_views')
    
    context = {
        'post_list': post_list,
        'popular_posts': popular_posts
    }
    return render(request, 'index.html', context)

def about(request):
    return render(request, 'about.html')

def discussion(request):
    return render(request, 'discussion.html')

def learn(request):
    return render(request, 'learn.html')

def techtalk(request):
    return render(request, 'techtalk.html')