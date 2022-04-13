from django.urls import path, include

from blog.serializer import TechtalkCreateSerializer, TechtalkDeleteSerializer

from .views import (PostListView2,CommentCreateView, LikeView,CreatePostView,PostDetailView,PostUpdateView,PostDeleteView,PostListView, TechtalkLikeList,UserPostListView
,UserTechtalkListView,CreateTechtalkView,TechtalkUpdateView,TechtalkDetailView,TechTalkListView,TechtalkDeleteView,
PostLikeList,LearnListView,LearnDetailView)
from . import views 

from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('posts',views.PostViewSet)
#router.register('learns',views.LearnViewSet)

urlpatterns = [
    path('post/', PostListView.as_view(), name = 'post-list'),
    path('post/user/<str:username>', UserPostListView.as_view(), name = 'user-posts'),
    path('post/<slug:slug>/',PostDetailView.as_view(), name = 'post_detail'),
    path('post/<slug:slug>/update/',PostUpdateView.as_view(), name = 'post-update'),
    path('post/<slug:slug>/delete/',PostDeleteView.as_view(), name = 'post-delete'),
    path('post/create',CreatePostView.as_view(),name = 'post_create'),
    path('post/<slug:slug>/comment/',CommentCreateView.as_view(),name = 'comment-create'),
    path('posts/<slug:slug>/like/',PostLikeList.as_view(),name = 'post_likes'),
    path('like/<int:pk>', LikeView, name = 'like_post'),
    path('about/', views.about, name = 'Blog-about'),
    path('techtalk/user/<str:username>',UserTechtalkListView.as_view(),name= 'user-techtalks'),
    path('techtalk/<slug:slug>/',TechtalkDetailView.as_view(), name = 'techtalk-detail'),
    path('techtalk/<slug:slug>/update/',TechtalkUpdateView.as_view(), name = 'techtalk-update'),
    path('techtalk/<slug:slug>/delete/',TechtalkDeleteView.as_view(), name = 'techtalk-delete'),
    path('techtalk/create',CreateTechtalkView.as_view(),name = 'techtalk-create'),
    path('techtalk/<slug:slug>/like/',TechtalkLikeList.as_view(),name = 'techtalk_likes'),
    path('techtalk/', TechTalkListView.as_view(), name = 'techtalk-list'),
    path('learn/', LearnListView.as_view(), name = 'learn-list'),
    path('learn/<slug:slug>/', LearnDetailView.as_view(), name = 'learn-detail'),
    #path('',include(router.urls)),    
    #path('postcategory/<str:name>/',CategoryPostListView.as_view(), name = 'category-posts'),
    path('home/', PostListView2.as_view(), name = 'blog-home'),
    
]








