import React, { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { getApi, postApi } from "../../api/service";
import {
  addView,
  getComments,
  getPostByCate,
  get_del_comment,
  get_del_edit_PostById,
} from "../../api/api";
import logo from "../../assets/bplLOGO.png";
import Comments from "../../components/Comments";
import { useRecoilState } from "recoil";
import { accountState } from "../../state/AccountState";
import { Icon } from "@iconify/react/dist/iconify.js";

export default function PostDetail() {
  const [account, setAccount] = useRecoilState(accountState)
  const [post, setPost] = useState();
  const [otherPost, setOther] = useState([]);
  const [comments, setComments] = useState([]);

  const params = useParams();
  const id = params.id;

  const navigate = useNavigate();
  useEffect(() => {
    getApi(get_del_edit_PostById, id).then((res) => {
      setPost(res);

      postApi(addView, {postId: res?.postId, accountId: account?.accountId})

      getApi(getPostByCate, res.categoryId).then((res2) => setOther(res2));

      getApi(get_del_comment, res.postId).then((res3) => setComments(res3));
    });
  },[id]);
  return (
    <div className="my-16">
      <div className="text-lg text-red-600 mb-3">
        {post?.Category?.categoryName}
      </div>
      <div className="text-2xl font-medium mb-3">{post?.title}</div>
      <div className="text-neutral-500 mb-3">{post?.createdDate}</div>
      <div className="text-neutral-500 flex items-center mb-3"><Icon icon="mdi:eye" className="mr-3"/> {post?.PostView?.length??0}</div>
      <div className="flex">
        <div className="w-4/6 mr-3">
          {post?.imageURL ? <img src={post?.imageURL} className="mb-5" /> : ""}
          <div className="font-medium text-lg mb-5">{post?.description}</div>
          <div dangerouslySetInnerHTML={{ __html: post?.content }} className="text-neutral-500"></div>
        </div>
        <div className="w-2/6 pl-5 max-h-screen overflow-y-auto">
          <div className="text-2xl font-medium mb-5">
            {post?.Category?.categoryName}
          </div>
          <div>
            {otherPost.map((post) => (
              <div
                onClick={() => navigate(`/PostDetail/${post?.postId}`)}
                className="flex mb-5"
              >
                <img className="w-1/3 mr-3" src={post?.imageURL ?? logo} />
                <div className="w-2/3 text-wrap">{post?.title}</div>
              </div>
            ))}
          </div>
        </div>
      </div>

      <Comments commentsState={[comments, setComments]} postId={post?.postId}/>
    </div>
  );
}
