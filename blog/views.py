from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from rest_framework.response import Response
from blog.serializer import PostSerializer
from .models import Learn, Post, Post_Category,Comment, Techtalk
from django.contrib.auth.models import User
from django.views.generic import DeleteView,ListView, DetailView, CreateView, UpdateView
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.urls import reverse
from . import serializer
from rest_framework.permissions import (
    AllowAny,
    IsAdminUser,
    IsAuthenticated,
    IsAuthenticatedOrReadOnly
)
from .permisssions import IsOwnerOrReadOnly
from rest_framework import viewsets,generics,status,views
from .serializer import (
    CommentSerializer,
    CreateCommentSerializer,
    LearnSerializer,
    PostDetailSerializer, 
    PostSerializer,
    PostCreateSerializer,
    PostDeleteSerializer,TechtalkLikeSerializer,
    PostUpdateSerializer,PostlikeSerializer,
    TechtalkSerializer,TechtalkDetailSerializer,TechtalkCreateSerializer,TechtalkDeleteSerializer,TechtalkUpdateSerializer)
from blog import permisssions
def home(request):
    context = {
        'posts': Post.objects.all()
    }
    return render(request, 'blog/home.html', context)

def LikeView(request,pk):
    post = get_object_or_404(Post, id = request.POST.get('post_id'))
    if post.likes.filter(id = request.user.id).exists():
        post.likes.remove(request.user)   
    else:    
        post.likes.add(request.user)
    return HttpResponseRedirect(reverse('post-detail', args=[str(pk)])) 

class LearnViewSet(viewsets.ModelViewSet):
    queryset = Learn.objects.all()
    serializer_class = LearnSerializer
    permission_classes = [AllowAny]

class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    permission_classes = [AllowAny]

class PostListView (generics.ListAPIView):
    serializer_class = PostSerializer
    permission_classes = [AllowAny]

    def get_queryset(self):
        return Post.objects.all().order_by('-date_posted')

class UserPostListView (generics.ListAPIView):
    serializer_class = PostSerializer
    permission_classes = [AllowAny]

    def get_queryset(self):
        user = get_object_or_404(User, username= self.kwargs.get('username'))
        return Post.objects.filter(author=user).order_by('-date_posted')        

class CreatePostView(generics.CreateAPIView):
    queryset = Post.objects.all()
    serializer_class = PostCreateSerializer
    permission_classes = [IsAuthenticated]


    def perform_create(self,serializer):
        serializer.save(author = self.request.user)

class PostDetailView(generics.RetrieveAPIView):
    queryset = Post.objects.all()
    serializer_class = PostDetailSerializer
    permission_classes = [AllowAny]
    lookup_field = 'slug'  
   

class PostUpdateView(generics.UpdateAPIView):
    queryset = Post.objects.all()
    serializer_class = PostUpdateSerializer
    permission_classes = [IsOwnerOrReadOnly]
    lookup_field = 'slug'

    def perform_create(self,serializer):
        serializer.save(author = self.request.user)

class PostDeleteView(generics.DestroyAPIView):
    queryset = Post.objects.all()
    serializer_class = PostDeleteSerializer
    permission_classes = [IsOwnerOrReadOnly,IsAdminUser]   
    lookup_field = 'slug' 

class CommentCreateView(generics.CreateAPIView):
    queryset = Comment.objects.all()
    serializer_class =  CreateCommentSerializer
    permisssion_classes = [IsAuthenticated]
    lookup_field = 'slug'

    def perform_create(self, serializer,slug= None):
        serializer.save(author = self.request.user)
        post = get_object_or_404(Post,slug= slug)
        serializer.save(post=post)

class TechTalkListView (generics.ListAPIView):
    serializer_class = TechtalkSerializer
    permission_classes = [AllowAny]

    def get_queryset(self):
        return Techtalk.objects.all().order_by('-date_posted')

class UserTechtalkListView (generics.ListAPIView):
    serializer_class = TechtalkSerializer
    permission_classes = [AllowAny]

    def get_queryset(self):
        user = get_object_or_404(User, username= self.kwargs.get('username'))
        return Techtalk.objects.filter(author=user).order_by('-date_posted')        

class CreateTechtalkView(generics.CreateAPIView):
    queryset = Techtalk.objects.all()
    serializer_class = TechtalkCreateSerializer
    permission_classes = [IsAuthenticated]


    def perform_create(self,serializer):
        serializer.save(author = self.request.user)

class TechtalkDetailView(generics.RetrieveAPIView):
    queryset = Techtalk.objects.all()
    serializer_class = TechtalkDetailSerializer
    permission_classes = [AllowAny]
    lookup_field = 'slug'  
   


class TechtalkUpdateView(generics.UpdateAPIView):
    queryset = Techtalk.objects.all()
    serializer_class = TechtalkUpdateSerializer
    permission_classes = [IsOwnerOrReadOnly]
    lookup_field = 'slug'

    def perform_create(self,serializer):
        serializer.save(author = self.request.user)

class TechtalkDeleteView(generics.DestroyAPIView):
    queryset = Techtalk.objects.all()
    serializer_class = TechtalkDeleteSerializer
    permission_classes = [IsOwnerOrReadOnly,IsAdminUser]   
    lookup_field = 'slug' 



class PostLikeList(views.APIView):
    def get(self,request,slug):#function to get total number of likes to particular post
        post = Post.objects.filter(slug=slug) # find which post's likes are to be extracted
        like_count = post.like_posts.count()# counts total user likes ,besides my code is wrong
        serializer = PostlikeSerializer(like_count,many=True)
        return Response(serializer.data)

    def post(self,request,slug):#function to add likes to post
        # how do I check if user is already liked the post ?
        likeusers = request.user
        likepost = Post.objects.filter(slug=slug)
        serializer = PostlikeSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(likeusers,likepost)
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)

class TechtalkLikeList(views.APIView):
    def get(self,request,slug):#function to get total number of likes to particular post
        techtalk = Techtalk.objects.filter(slug=slug) # find which post's likes are to be extracted
        like_count = techtalk.like_techtalks.count()# counts total user likes ,besides my code is wrong
        serializer = PostlikeSerializer(like_count,many=True)
        return Response(serializer.data)

    def post(self,request,slug):#function to add likes to post
        # how do I check if user is already liked the post ?
        likeusers = request.user
        likepost = Techtalk.objects.filter(slug=slug)
        serializer = TechtalkLikeSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(likeusers,likepost)
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)


class LearnDetailView(generics.RetrieveAPIView):
    queryset = Learn.objects.all()
    serializer_class = LearnSerializer
    permission_classes = [AllowAny]
    lookup_field = 'slug'  

class LearnListView (generics.ListAPIView):
    serializer_class = LearnSerializer
    permission_classes = [AllowAny]

    def get_queryset(self):
        return Learn.objects.all().order_by('-created_on')


class PostListView2(ListView):
    model = Post
    template_name = 'blog/home.html' #<app>/<model>_<viewtype>
    context_object_name = 'posts'
    ordering = ['-date_posted']
    paginate_by = 5
'''
class UserPostListView(ListView):
    model = Post
    template_name = 'blog/user_posts.html' #<app>/<model>_<viewtype>
    context_object_name = 'posts'
    paginate_by = 5

    def get_queryset(self):
        user = get_object_or_404(User, username= self.kwargs.get('username'))
        return Post.objects.filter(author=user).order_by('-date_posted')

class CategoryPostListView(ListView):
    model = Post
    template_name = 'blog/category_posts.html'
    context_object_name = 'posts'
    paginate_by = 5

    def get_queryset(self):
        cats = get_object_or_404(Post_Category, name = self.kwargs.get('name'))
        return Post.objects.filter(category= cats).order_by('-date_posted')
    

class PostDetailView(DetailView):
    model = Post

    def get_context_data(self,*args, **kwargs): 
        context = super(PostDetailView,self).get_context_data(*args,**kwargs)
        
        stuff = get_object_or_404(Post, id = self.kwargs['pk'])
        total_likes  = stuff.total_likes()
        comment_form = CommentForm()
        comments = Comment.objects.filter(post= stuff).order_by('-created_on')
        liked = False
        if stuff.likes.filter(id = self.request.user.id).exists():
            liked = True

        context["total_likes"] = total_likes # phan trong context la ten bien dung trong html
        context["liked"] = liked
        context["comment_form"] = comment_form
        context["comments"] = comments
        return context
    
    def post(self,request,pk,*args,**kwargs):
        post = Post.objects.get(pk=pk)
        comment_form = CommentForm(request.POST)

        if comment_form.is_valid():
            new_comment= comment_form.save(commit = False)
            new_comment.author = request.user
            new_comment.post = post
            new_comment.save()

        comments = Comment.objects.filter(post= post).order_by('-created_on')    

        context = {
            'post': post,
            'comment_form': comment_form,
            'comments': comments
        }  
        return HttpResponseRedirect(reverse('post-detail', args=[str(pk)])) 
        #render(request, 'blog/post_detail.html',context)  
class PostCreateView(LoginRequiredMixin,CreateView):
    model = Post
    fields = ['title', 'content', 'category']

    def form_valid(self,form):
        form.instance.author = self.request.user
        return super().form_valid(form)

class PostUpdateView(LoginRequiredMixin,UserPassesTestMixin,UpdateView):
    model = Post
    fields = ['title', 'content', 'category']

    def form_valid(self,form):
        form.instance.author = self.request.user
        return super().form_valid(form)

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False        

class PostDeleteView (LoginRequiredMixin,UserPassesTestMixin, DeleteView):
    model = Post
    success_url = '/'

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False
'''

def about(request):
    return render(request, 'blog/about.html')