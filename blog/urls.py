from django.urls import path, include

from .views import LikeView,CreatePostView,PostDetailView,PostUpdateView,PostDeleteView,PostListView,UserPostListView
from . import views 

from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('posts',views.PostViewSet)


urlpatterns = [
    path('', PostListView.as_view(), name = 'blog-home'),
    path('user/<str:username>', UserPostListView.as_view(), name = 'user-posts'),
    path('post/<slug:slug>/',PostDetailView.as_view(), name = 'post_detail'),
    path('post/<slug:slug>/update/',PostUpdateView.as_view(), name = 'post-update'),
    path('post/<slug:slug>/delete/',PostDeleteView.as_view(), name = 'post-delete'),
    #path('postcategory/<str:name>/',CategoryPostListView.as_view(), name = 'category-posts'),
    path('about/', views.about, name = 'Blog-about'),
    path('like/<int:pk>', LikeView, name = 'like_post'),
    path('',include(router.urls)),
    path('api/blog/create',CreatePostView.as_view(),name = 'post_create')
]








