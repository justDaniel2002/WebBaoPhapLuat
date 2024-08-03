import React, { useCallback, useEffect, useRef, useState } from "react";
import logo from "../../assets/bplLOGO.png";
import { useLocation, useNavigate } from "react-router-dom";
import {
  changePostStatus,
  getPosts,
  getStaticInfo,
  get_del_edit_PostById,
} from "../../api/api";
import { delApi, getApi, putApi } from "../../api/service";
import { Modal } from "rc-modal-sheet";
import { toast } from "react-toastify";
import { useRecoilState } from "recoil";
import { accountState } from "../../state/AccountState";
export default function AdminPage() {
  const [search, setSearch] = useState("")
  const [account, setAccount] = useRecoilState(accountState);
  const [posts, setPosts] = useState([]);
  const navigate = useNavigate();
  const [open, setOpen] = useState(false);
  
  const [section, setSection] = useState("BDDDD");
  let selectedDeletePostId = useRef();

  const getData = useCallback(() => {
    getApi(getPosts).then((res) => setPosts(res));
    
  });
  useEffect(() => {
    getData();
  }, []);

  const deletePost = (id) => {
    delApi(get_del_edit_PostById, id)
      .then(() => {
        toast.success("Đã xóa bài đăng");
        getApi(getPosts).then((res) => setPosts(res));
      })
      .catch(() => toast.error("Xóa bài đăng thất bại"));
  };

  const browsePost = (id) => {
    putApi(changePostStatus, {}, id).then(() => {
      getData();
      toast.success("Đã duyệt thành công");
    });
  };
  return (
    <div className="pt-20 px-10">
      <div className="">
        <input
          placeholder="Tiêu đề"
          value={search}
          onChange={(event) => setSearch(event.target.value)}
          className="my-5 border border-neutral-500 rounded-md px-3 py-1 w-2/6"
        />
      </div>
      {account?.roleId == 1 && (
        <div className="flex items-center font-medium mb-5">
          <button
            className={`border rounded-3xl px-3 py-2 mr-3 hover:font-bold transition-all ${
              section == "BDDDD" ? "bg-red-600 text-white" : "text-red-600"
            }`}
            onClick={() => setSection("BDDDD")}
          >
            Bài đăng đã được duyệt
          </button>
          <button
            className={`border rounded-3xl px-3 py-2 mr-3 hover:font-bold transition-all ${
              section == "BDCDD" ? "bg-red-600 text-white" : "text-red-600"
            }`}
            onClick={() => setSection("BDCDD")}
          >
            Bài đăng chờ được duyệt
          </button>
        </div>
      )}
      <div className=" flex flex-wrap">
        {section == "BDDDD" ? (
          <>
            {" "}
            {posts
              .filter((p) => p.status&&p?.title?.includes(search))
              .map((post) => (
                <div className="hover:-translate-y-5 transition-all rounded-xl border w-3/12 pb-3 shadow-2xl mr-5 mb-10 flex flex-col justify-between">
                  <img className="mb-5" src={post?.imageURL ?? logo} />
                  <div className="px-5">
                    <div className="font-bold text-lg">{post?.title}</div>
                    <div className="text-neutral-500 truncate">
                      {post?.description}
                    </div>
                    <div className="text-right text-xs text-neutral-500">
                      {post?.createdDate}
                    </div>
                    <div className="flex justify-end mt-5 mb-1">
                      <button
                        onClick={() => navigate(`/PostDetail/${post?.postId}`)}
                        className="hover:font-bold transition-all rounded-3xl px-5 py-1 border font-thin text-red-600 mr-3"
                      >
                        Chi tiết
                      </button>
                      <button
                        onClick={() => {
                          selectedDeletePostId.current = post?.postId;
                          setOpen(true);
                        }}
                        className="hover:font-bold transition-all rounded-3xl px-5 py-1 font-thin bg-red-600 text-white"
                      >
                        Xóa
                      </button>
                    </div>
                    <div className="text-neutral-500 text-sm flex justify-between">
                      <div>comment: {post?.Comment?.length ?? 0}</div>
                      <div>Lượt xem: {post?.PostView?.length ?? 0}</div>
                    </div>
                  </div>
                </div>
              ))}
          </>
        ) : section == "BDCDD" ? (
          <>
            {posts
              .filter((p) => !p.status&&p?.title?.includes(search))
              .map((post) => (
                <div className="hover:-translate-y-5 transition-all rounded-xl border w-3/12 pb-3 shadow-2xl mr-5 mb-10 flex flex-col justify-between">
                  <img className="mb-5" src={post?.imageURL ?? logo} />
                  <div className="px-5">
                    <div className="font-bold text-lg">{post?.title}</div>
                    <div className="text-neutral-500 truncate">
                      {post?.description}
                    </div>
                    <div className="text-right text-xs text-neutral-500">
                      {post?.createdDate}
                    </div>
                    <div className="flex flex-wrap justify-end mt-5 mb-1">
                      <button
                        onClick={() => navigate(`/PostDetail/${post?.postId}`)}
                        className="hover:font-bold transition-all rounded-3xl px-5 py-1 border font-thin text-red-600 mr-3"
                      >
                        Chi tiết
                      </button>
                      <button
                        onClick={() => {
                          selectedDeletePostId.current = post?.postId;
                          setOpen(true);
                        }}
                        className="hover:font-bold transition-all rounded-3xl px-5 py-1 font-thin bg-red-600 text-white"
                      >
                        Xóa
                      </button>

                      <button
                        onClick={() => browsePost(post?.postId)}
                        className="hover:font-bold transition-all rounded-3xl px-5 py-1 border font-thin text-green-600 mr-3 mt-2"
                      >
                        Duyệt
                      </button>
                    </div>
                    <div className="text-neutral-500 text-sm flex justify-between">
                      <div>comment: {post?.Comment?.length ?? 0}</div>
                      <div>Lượt xem: {post?.PostView?.length ?? 0}</div>
                    </div>
                  </div>
                </div>
              ))}
          </>
        ) : (
          <></>
        )}

        <Modal
          className="bg-white"
          title="Bạn có chắc muốn xóa bài báo này ?"
          open={open}
          onOpenChange={setOpen}
        >
          <div className="px-10">
            <p>Hành động này sẽ không thể quay lại</p>
            <div className="flex justify-end mt-5">
              <button
                onClick={() => {
                  console.log(selectedDeletePostId.current);
                  deletePost(selectedDeletePostId.current);
                  setOpen(false);
                }}
                className="bg-red-500 text-white px-3 py-2 rounded-lg"
              >
                Xóa
              </button>
            </div>
          </div>
        </Modal>
      </div>
    </div>
  );
}
