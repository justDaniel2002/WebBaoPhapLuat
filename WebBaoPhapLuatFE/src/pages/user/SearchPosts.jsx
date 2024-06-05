import React, { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { getApi } from "../../api/service";
import { getCategoryById, getPostByCate, searchPost } from "../../api/api";

export default function SearchPosts() {
  const [posts, setPosts] = useState([]);
  const params = useParams();
  const search = params.search;

  const navigate = useNavigate()
  useEffect(() => {
    getApi(searchPost, search).then((res) => setPosts(res));
  }, []);
  return (
    <div className="py-16">
      <div className="text-xl text-red-600 mb-10">TÌM KIẾM BÀI BÁO "{search}"</div>
      <div>
        {posts.map((post) => (
          <div onClick={() => navigate(`/PostDetail/${post?.postId}`)} className="my-5">
            <div className="text-lg mb-3">{post?.title}</div>
            <div className="flex">
              {post?.imageURL ? (
                <img src={post?.imageURL} className="w-1/5 mr-2" />
              ) : (
                ""
              )}
              <div className="text-neutral-500">{post?.description}</div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
