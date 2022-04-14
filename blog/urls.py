from django.urls import path, include

from blog.serializer import PostCreateSerializer, TechtalkCreateSerializer, TechtalkDeleteSerializer

from .views import (PostListView2,CommentCreateView, LikeView,CreatePostView,PostDetailView,PostUpdateView,PostDeleteView,PostListView, UserPostListView
,UserTechtalkListView,CreateTechtalkView,TechtalkUpdateView,TechtalkDetailView,TechTalkListView,TechtalkDeleteView,
LearnListView,LearnDetailView,like_create_api,techtalk_like_create_api,techtalk_subcribe_create_api,
CreatePostView)
from . import views 

from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('posts',views.PostViewSet)
#router.register('learns',views.LearnViewSet)

urlpatterns = [
    path('post/', PostListView.as_view(), name = 'post-list'),
    path('post/user/<str:username>', UserPostListView.as_view(), name = 'user-posts'),
    path('post/', CreatePostView.as_view(), name = 'post-create'),
    path('post/<int:pk>/',PostDetailView.as_view(), name = 'post_detail'),
    path('post/<slug:slug>/update/',PostUpdateView.as_view(), name = 'post-update'),
    path('post/<slug:slug>/delete/',PostDeleteView.as_view(), name = 'post-delete'),
    path('post/create',CreatePostView.as_view(),name = 'post_create'),
    path('post/<slug:slug>/comment/',CommentCreateView.as_view(),name = 'comment-create'),
    path('posts/<slug:slug>/like/',like_create_api,name = 'post_likes'),
    path('like/<int:pk>', LikeView, name = 'like_post'),
    path('about/', views.about, name = 'Blog-about'),
    path('techtalk/user/<str:username>',UserTechtalkListView.as_view(),name= 'user-techtalks'),
    path('techtalk/<slug:slug>/',TechtalkDetailView.as_view(), name = 'techtalk-detail'),
    path('techtalk/<slug:slug>/update/',TechtalkUpdateView.as_view(), name = 'techtalk-update'),
    path('techtalk/<slug:slug>/delete/',TechtalkDeleteView.as_view(), name = 'techtalk-delete'),
    path('techtalk/create',CreateTechtalkView.as_view(),name = 'techtalk-create'),
    path('techtalk/<slug:slug>/like/',techtalk_like_create_api,name = 'techtalk_likes'),
    path('techtalk/<slug:slug>/subcribe/',techtalk_subcribe_create_api,name = 'techtalk_subcribes'),
    path('techtalk/', TechTalkListView.as_view(), name = 'techtalk-list'),
    path('learn/', LearnListView.as_view(), name = 'learn-list'),
    path('learn/<slug:slug>/', LearnDetailView.as_view(), name = 'learn-detail'),
    #path('',include(router.urls)),    
    #path('postcategory/<str:name>/',CategoryPostListView.as_view(), name = 'category-posts'),
    path('home/', PostListView2.as_view(), name = 'blog-home'),
    
]








