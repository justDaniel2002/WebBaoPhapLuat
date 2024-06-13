import { useEffect, useState } from "react";
import { getApi } from "../../api/service";
import { getPosts, getTags } from "../../api/api";
import { useNavigate } from "react-router-dom";
import logo from "../../assets/bplLOGO.png";

export const Home = () => {
  const [posts, setPosts] = useState([]);
  const [tags, setTags] = useState([]);

  const navigate = useNavigate();
  useEffect(() => {
    getApi(getPosts).then((res) => setPosts(res));
    getApi(getTags).then((res) => {
      console.log("tag", res);
      setTags(res);
    });
  }, []);
  return (
    <>
      <div className="flex mb-10">
        <div className="w-1/4 px-2">
          {posts.slice(0, 2).map((post) => (
            <div
              onClick={() => navigate(`/PostDetail/${post.postId}`)}
              className="text-wrap truncate mb-5"
            >
              {post?.imageURL ? (
                <img className="w-full mb-3" src={post?.imageURL} />
              ) : (
                ""
              )}
              <div className="font-light text-2xl mb-3 hover:text-red-600">
                {post?.title}
              </div>
              {post?.imageURL ? (
                ""
              ) : (
                <div className="font-normal text-neutral-500">
                  {post?.description}
                </div>
              )}
            </div>
          ))}
        </div>
        <div className="w-2/4 px-2">
          <div
            onClick={() => navigate(`/PostDetail/${posts[3].postId}`)}
            className="text-wrap truncate text-center"
          >
            {posts[3]?.imageURL ? (
              <img className="w-full mb-5" src={posts[3]?.imageURL} />
            ) : (
              ""
            )}
            <div className="font-medium text-3xl mb-5 hover:text-red-600">
              {posts[3]?.title}
            </div>
            <div className="font-normal text-neutral-500">
              {posts[3]?.description}
            </div>
          </div>
        </div>
        <div className="w-1/4 px-2">
          {posts.slice(4, 6).map((post) => (
            <div
              onClick={() => navigate(`/PostDetail/${post.postId}`)}
              className="text-wrap truncate mb-5"
            >
              {post?.imageURL ? (
                <img className="w-full mb-3" src={post?.imageURL} />
              ) : (
                ""
              )}
              <div className="font-light text-2xl mb-3 hover:text-red-600">
                {post?.title}
              </div>
              {post?.imageURL ? (
                ""
              ) : (
                <div className="font-normal text-neutral-500">
                  {post?.description}
                </div>
              )}
            </div>
          ))}
        </div>
      </div>

      {tags.map((tag) => (
        <>
          <div className="w-full bg-neutral-100 p-5 mb-10">
            <div className="text-3xl text-slate-900 font-light text-center mb-10">
              {tag?.tagName?.toUpperCase()}
            </div>

            {tag?.Post[0]?<div onClick={() => navigate(`/PostDetail/${tag?.Post[0].postId}`)} className="flex items-center">
              <div className="w-1/2 mr-10">
                <img className="mb-5 w-full" src={tag?.Post[0]?.imageURL ?? logo} />
              </div>
              <div className="w-1/2">
                <div className="font-medium text-3xl mb-5 hover:text-red-600">
                  {tag?.Post[0]?.title}
                </div>
                <div className="font-normal text-neutral-500">
                  {tag?.Post[0]?.description}
                </div>
              </div>
            </div>:""}

            <div className="flex mt-10 justify-around">
              {tag?.Post?.slice(1, 4)?.map((p) => (
                <div
                  onClick={() => navigate(`/PostDetail/${p.postId}`)}
                  className="hover:-translate-y-5 transition-all rounded-xl border w-3/12 pb-3 shadow-2xl mr-5 mb-10 flex flex-col justify-between"
                >
                  <img className="mb-5" src={p?.imageURL ?? logo} />
                  <div className="px-5">
                    <div className="font-bold text-lg">{p?.title}</div>
                    <div className="text-neutral-500 truncate">
                      {p?.description}
                    </div>
                    <div className="text-right text-xs text-neutral-500">
                      {p?.createdDate}
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </>
      ))}
    </>
  );
};
