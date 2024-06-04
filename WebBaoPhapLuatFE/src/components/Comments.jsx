import React from "react";
import { useRecoilState } from "recoil";
import { accountState } from "../state/AccountState";
import { EmptyAvatar } from "../data/data";

export default function Comments({ commentsState }) {
  const [comments, setComments] = commentsState;
  const [account, setAccount] = useRecoilState(accountState);
  return (
    <div className="my-5">
      <div className="text-2xl font-serif mb-5">BÌNH LUẬN</div>

      <div className="mb-5">
        {account ? (
          <div>
            <textarea
              className="bg-neutral-100 w-full h-20 px-5 py-3 mb-3"
              placeholder="Nhập nội dung bình luận"
            />
            <div className="flex justify-end">
              <button className="px-5 py-3 text-white bg-red-600">Gửi bình luận</button>
            </div>
          </div>
        ) : (
          <button className="px-5 py-3 text-white bg-red-600">
            Đăng nhập để bình luận
          </button>
        )}
      </div>

      {comments.map((comment) => (
        <div className="flex items-center">
          <div className="mr-5">
            <img src={EmptyAvatar} className="rounded-full w-1/12 mb-2" />
            <div>{comment?.Account?.email}</div>
          </div>

        <div>
            <div className="text-lg font-semibold">{comment?.content}</div>
            <div className="text-sm text-neutral-500">{comment?.createdDate}</div>
        </div>
        </div>
      ))}
    </div>
  );
}
