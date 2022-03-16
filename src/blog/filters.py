import django_filters
from .models import Post

def order_view_post(request):
    posts = Post.objects.filter(is_published=True).order_by('blog_views')