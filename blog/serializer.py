from rest_framework import serializers
from rest_framework.serializers import ModelSerializer,SerializerMethodField
from .models import Learn, Post,Comment, Techtalk, TechtalkSubcribe
from django.shortcuts import get_object_or_404

class PostSerializer(ModelSerializer):
    class Meta: 
        model = Post
        fields = ["id","title","content","author"]

class PostDetailSerializer(ModelSerializer):
    author = serializers.ReadOnlyField(source='author.username')
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
        fields = ["id","title","content","author"] 

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
        fields = ["comment","user"]        



class TechtalkSerializer(ModelSerializer):
    class Meta: 
        model = Techtalk
        fields = ["id","title","content","start_on","author"]

class TechtalkDetailSerializer(ModelSerializer):
    author = serializers.ReadOnlyField(source='author.username')


    class Meta: 
        model = Techtalk
        fields = ["id","title","content","start_on","author","total_likes"]
 

    
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


              

class TechtalkSubcribeSerializer(serializers.ModelSerializer):
    class Meta:
        model = TechtalkSubcribe
        fields = '__all__'

class LearnSerializer(serializers.ModelSerializer):
    class Meta:
        model = Learn
        fields = '__all__'        