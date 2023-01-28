import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netgalpi/model/post_model.dart';

List<String> imgUrlList = [
  'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/a8d1f618-7481-41f3-abc2-396a3b567684/IMG_5854.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230128T070504Z&X-Amz-Expires=86400&X-Amz-Signature=070fea7167c40f912ebf0f123b04bd5dac4c2d36eb4912299e0188ec03e38197&X-Amz-SignedHeaders=host&response-content-disposition=filename%3D%22IMG_5854.JPG.jpg%22&x-id=GetObject',
  'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/562d2f0b-2d39-419f-ae30-a1d65c96cbf3/e1359937-c5de-4f78-a3cc-227420439b2a.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230128T070528Z&X-Amz-Expires=86400&X-Amz-Signature=22db2ed8a7b42e2b96d5f0ddc01d24dca1696c504a9c6054fb076cb474d67fa2&X-Amz-SignedHeaders=host&response-content-disposition=filename%3D%22e1359937-c5de-4f78-a3cc-227420439b2a.png%22&x-id=GetObject',
  'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/f277d527-4187-454b-9204-6c391fa186b6/FSc-N-EaMAAFB_L.jpg-large.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230128T070627Z&X-Amz-Expires=86400&X-Amz-Signature=5e3c2d97d8dc60a041014d122c0cd9943fa826d9e1b65423f95f116f35e973b3&X-Amz-SignedHeaders=host&response-content-disposition=filename%3D%22FSc-N-EaMAAFB_L.jpg-large.jpeg%22&x-id=GetObject',
  'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/0b342176-b908-47d2-b892-364b70122717/aa58e437-05db-4183-9d4d-7ec40a008d88.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230128T070621Z&X-Amz-Expires=86400&X-Amz-Signature=42263a88f2acaa84a7b42b53e9534f68dcbddd9c35069a516cd95766d4b985ab&X-Amz-SignedHeaders=host&response-content-disposition=filename%3D%22aa58e437-05db-4183-9d4d-7ec40a008d88.jpg%22&x-id=GetObject',
  'https://s3.us-west-2.amazonaws.com/secure.notion-static.com/5ce2e844-fef2-42ff-b9c2-4d381d5c3584/R658x0.q70.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20230128%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20230128T070632Z&X-Amz-Expires=86400&X-Amz-Signature=ba33077fdb8841478b949631025a088bf662a09d8ea09c47240e7e9484ecf7b6&X-Amz-SignedHeaders=host&response-content-disposition=filename%3D%22R658x0.q70.jpeg%22&x-id=GetObject',
];

class PostListViewModel extends GetxController {
  List<PostModel> postList = [];
  Map<String, CachedNetworkImageProvider> postImgMap = {};
  List<String> currentPostIdList = [];

  void setPostList(List<PostModel> newPostList) {
    postList = newPostList;
    // set postIdList and postImgMap
    for (var element in postList) {
      if (element.postId != null) {
        postImgMap[element.postId!] =
            CachedNetworkImageProvider(element.imageUrl);
      }
    }
  }

  void setCurrentPostIdList(List<String> postIdList) {
    currentPostIdList = [...postIdList];
  }

  void addNewPost(PostModel newPost) {
    postList.add(newPost);
    postImgMap[newPost.postId!] = CachedNetworkImageProvider(newPost.imageUrl);
  }
}
