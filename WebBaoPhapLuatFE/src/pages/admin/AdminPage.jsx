import React from "react";
import logo from "../../assets/bplLOGO.png"
export default function AdminPage() {
  return (
    <div className="pt-20 px-10 flex flex-wrap">
      {posts.map((post) => (
        <div className="rounded-xl border w-1/3 mr-5">
            <img className="mb-5" src={post?.imageURL??logo}/>
            <div className="font-bold text-lg">{post?.title}</div>
            <div className="text-neutral-500 truncate">{post?.description}</div>
        </div>
      ))}
    </div>
  );
}
