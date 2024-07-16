import React, { useCallback, useEffect, useState } from "react";
import { delApi, getApi } from "../../api/service";
import { getComments, get_del_comment } from "../../api/api";
import { Table, commentManagerHeader } from "../../components/Table";
import { useLocation, useNavigate } from "react-router-dom";
export default function CommentManager() {
  const [comments, setComments] = useState([]);
  const [search, setSearch] = useState("")

  const getComts = useCallback(() => {
    getApi(getComments).then((res) => setComments(res));
  }, []);

  const navigate = useNavigate();
  useEffect(() => {
    getComts();
  }, []);

  const ActionTd = useCallback(({data}) => (<td className="px-2 min-w-40 border">
    <button
      onClick={() => {
        navigate(`/PostDetail/${data.Post.postId}`);
      }}
      className="text-white px-3 py-2 rounded-xl bg-blue-500 mr-3"
    >
      Chi tiết
    </button>
    <button
      onClick={() => {
        delApi(get_del_comment, data.commentId).then(() => getComts());
      }}
      className="text-white px-3 py-2 rounded-xl bg-red-500"
    >
      Xóa
    </button>
  </td>), []);
  return (
    <div className="py-40 px-20">
      <div className="">
        <input
          placeholder="Nội dung"
          value={search}
          onChange={(event) => setSearch(event.target.value)}
          className="my-5 border border-neutral-500 rounded-md px-3 py-1 w-2/6"
        />
      </div>
      <Table datas={comments.filter(c => c?.content?.includes(search))} headers={commentManagerHeader} ActionTd={ActionTd}/>
    </div>
  );
}
