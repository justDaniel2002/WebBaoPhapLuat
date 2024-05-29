import { posts, tags } from "../../data/data";

export const Home = () => {
  return (
    <>
      <div className="flex mb-10">
        <div className="w-1/4 px-2">
          {posts.slice(0, 2).map((post) => (
            <div className="text-wrap truncate mb-5">
              {post?.imageUrl ? (
                <img className="w-full mb-3" src={post.imageUrl} />
              ) : (
                ""
              )}
              <div className="font-light text-2xl mb-3 hover:text-red-600">
                {post.title}
              </div>
              {post?.imageUrl ? (
                ""
              ) : (
                <div className="font-normal text-neutral-500">
                  {post.description}
                </div>
              )}
            </div>
          ))}
        </div>
        <div className="w-2/4 px-2">
          <div className="text-wrap truncate text-center">
            {posts[3]?.imageUrl ? (
              <img className="w-full mb-5" src={posts[3].imageUrl} />
            ) : (
              ""
            )}
            <div className="font-medium text-3xl mb-5 hover:text-red-600">
              {posts[3].title}
            </div>
            <div className="font-normal text-neutral-500">
              {posts[3].description}
            </div>
          </div>
        </div>
        <div className="w-1/4 px-2">
          {posts.slice(4, 6).map((post) => (
            <div className="text-wrap truncate mb-5">
              {post?.imageUrl ? (
                <img className="w-full mb-3" src={post.imageUrl} />
              ) : (
                ""
              )}
              <div className="font-light text-2xl mb-3 hover:text-red-600">
                {post.title}
              </div>
              {post?.imageUrl ? (
                ""
              ) : (
                <div className="font-normal text-neutral-500">
                  {post.description}
                </div>
              )}
            </div>
          ))}
        </div>
      </div>

      {tags.map((tag) => (
        <>
        <div className="w-full bg-neutral-100 p-5 mb-10">
            <div className="text-3xl text-slate-900 font-serif text-center">{tag.toUpperCase()}</div>
        </div>
        </>
      ))}
    </>
  );
};
