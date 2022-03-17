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

    #all post
    post_list = Post.objects.all()
    
    #popular list
    listsorted = Post.objects.filter(is_published=True).order_by('-blog_views')

    hotposts = [
        listsorted[0],
        listsorted[1],
        listsorted[2],
    ]
    

    #hot users

    context = {
        'post_list': post_list,
        'hotposts': hotposts,
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