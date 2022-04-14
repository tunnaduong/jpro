from rest_framework import serializers
from rest_framework.serializers import ModelSerializer,SerializerMethodField
from .models import Learn, Post,Comment, Techtalk,Tag
from users.models import Profile
from django.shortcuts import get_object_or_404

class TagSerializer(ModelSerializer):
    class Meta:
        model = Tag
        fields = '__all__'

class PostSerializer(ModelSerializer):
    authorname = serializers.ReadOnlyField(source='author.get_full_name')
    username = serializers.ReadOnlyField(source = 'author.username')
    avatar = SerializerMethodField()

    class Meta: 
        model = Post
        fields = ["id","title","content","author","date_posted","authorname","avatar","username"]

    def get_avatar(self,post):
        request = self.context.get('request')
        profile = get_object_or_404(Profile,user = post.author)
        avatar_url = profile.image.url
        return request.build_absolute_uri(avatar_url)    

class PostDetailSerializer(ModelSerializer):
    author = serializers.ReadOnlyField(source='author.get_full_name')
    comments = serializers.SerializerMethodField()

    class Meta: 
        model = Post
        fields = ["id","title","content","author","date_posted","comments","total_likes"] 

    def get_comments(self, obj):
        post = obj.id
        c_qs = Comment.objects.filter(post = post) 
        comments = CommentSerializer(c_qs, many = True).data
        return comments 

    
class PostUpdateSerializer(ModelSerializer):
    class Meta: 
        model = Post
        fields = ["id","title","content","author","authorname"] 

class PostDeleteSerializer(ModelSerializer):
    class Meta: 
        model = Post
        fields = ["id","title","content","author"] 

class PostCreateSerializer(ModelSerializer):
    class Meta:
        model = Post
        fields = ["id","title","content"] 

class CommentSerializer(ModelSerializer):
    user = serializers.ReadOnlyField(source='author.username')

    class Meta:
        model = Comment
        fields = ["comment", "user"]

class CreateCommentSerializer(ModelSerializer):
    user = serializers.ReadOnlyField(source='author.username')

    class Meta:
        model =  Comment
        fields = ["comment","user","post"]        



class TechtalkSerializer(ModelSerializer):
    class Meta: 
        model = Techtalk
        fields = ["id","title","content","start_on","author"]

class TechtalkDetailSerializer(ModelSerializer):
    author = serializers.ReadOnlyField(source='author.username')


    class Meta: 
        model = Techtalk
        fields = ["id","title","content","start_on","author","total_likes","total_subcribes"]
 

    
class TechtalkUpdateSerializer(ModelSerializer):
    class Meta: 
        model = Techtalk
        fields =  ["id","title","content","start_on","author"]

class TechtalkDeleteSerializer(ModelSerializer):
    class Meta: 
        model = Techtalk
        fields =  ["id","title","content","start_on","author"] 

class TechtalkCreateSerializer(ModelSerializer):
    class Meta:
        model = Techtalk
        fields =  ["id","title","content","start_on","author"] 


            

class LearnSerializer(serializers.ModelSerializer):
    class Meta:
        model = Learn
        fields = '__all__'        