import React, { useState } from "react";
import { useRecoilState } from "recoil";
import { accountState } from "../state/AccountState";
import { EmptyAvatar } from "../data/data";
import { toast } from "react-toastify";
import { delApi, getApi, postApi } from "../api/service";
import { addComment, getComments, get_del_comment } from "../api/api";
import { useNavigate } from "react-router-dom";
import { formatDate } from "../helpers/helpers";

export default function Comments({ commentsState, postId }) {
  const [comments, setComments] = commentsState;
  const [account, setAccount] = useRecoilState(accountState);
  const [content, setContent] = useState("");

  const navigate = useNavigate();
  const comment = () => {
    if (content.length == 0) {
      toast.warning("Nhập bình luận");
      return;
    }

    postApi(addComment, { content, accountId: account.accountId, postId }).then(
      () => {
        setContent("");
        getApi(get_del_comment, postId).then((res) => {
          setComments(res);
        });
      }
    );
  };

  const delComment = (id) => {
    delApi(get_del_comment, id).then(() =>
      getApi(get_del_comment, postId).then((res) => {
        console.log(res);
        setComments(res);
      })
    );
  };
  return (
    <div className="my-5">
      <div className="text-2xl font-serif mb-5">BÌNH LUẬN</div>

      <div className="mb-5">
        {account ? (
          <div>
            <textarea
              className="bg-neutral-100 w-full h-20 px-5 py-3 mb-3"
              placeholder="Nhập nội dung bình luận"
              value={content}
              onChange={(event) => setContent(event.target.value)}
            />
            <div className="flex justify-end">
              <button
                onClick={comment}
                className="px-5 py-3 text-white bg-red-600"
              >
                Gửi bình luận
              </button>
            </div>
          </div>
        ) : (
          <button
            onClick={() => navigate("/auth/login")}
            className="px-5 py-3 text-white bg-red-600"
          >
            Đăng nhập để bình luận
          </button>
        )}
      </div>

      {comments.map((comment) => (
        <>
          <div className="flex items-center">
            <div className="mr-5 w-12">
              <img src={EmptyAvatar} className="rounded-full mb-2" />
            </div>

            <div>
              <div>{comment?.Account?.email}</div>
              <div className="text-lg font-semibold">{comment?.content}</div>
              <div className="text-sm text-neutral-500">
                {formatDate(comment?.createdDate)}
              </div>
              {comment?.accountId == account?.accountId ? (
                <div
                  onClick={() => delComment(comment?.commentId)}
                  className="mt-3 text-neutral-500 hover:text-red-500"
                >
                  Gỡ
                </div>
              ) : (
                ""
              )}
            </div>
          </div>

          <hr className="my-5" />
        </>
      ))}
    </div>
  );
}
