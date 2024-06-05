import { Icon } from "@iconify/react/dist/iconify.js";
import React, { useState } from "react";
import { addPost, postApi } from "../../api/service";
import { uploadPost } from "../../api/api";
import { toast } from "react-toastify";
import { useNavigate } from "react-router-dom";
import { useRecoilState } from "recoil";
import { accountState } from "../../state/AccountState";

export default function AddPostPage() {
    const [account, setAccount] = useRecoilState(accountState)
  const [File, setFile] = useState();
  const [content, setContent] = useState(
    "Drop file or click in here to submit excel file"
  );
  const navigate = useNavigate()

  const handleFileChange = (event) => {
    const file = event.target.files[0];
    setFile(file);
    console.log("Selected file:", file);

    // You can now perform further actions with the file, such as uploading it
  };

  function onDropTotal(ev) {
    setContent("Drop file or click in here to submit excel file");
    ev.preventDefault();
  }
  function dropHandler(ev) {
    console.log("File(s) dropped");
    setContent("Drop file or click in here to submit excel file");
    // Prevent default behavior (Prevent file from being opened)
    ev.preventDefault();

    if (ev.dataTransfer.items) {
      // Use DataTransferItemList interface to access the file(s)
      [...ev.dataTransfer.items].forEach((item, i) => {
        // If dropped items aren't files, reject them
        if (item.kind === "file") {
          const file = item.getAsFile();
          console.log(`… file[${i}].name = ${file.name}`);
          setFile(file);
        }
      });
    } else {
      // Use DataTransfer interface to access the file(s)
      [...ev.dataTransfer.files].forEach((file, i) => {
        console.log(`… file[${i}].name = ${file.name}`);
      });
    }
  }

  function dragOverHandler(ev) {
    console.log("File(s) in drop zone");
    setContent("You are in drop zone");
    // Prevent default behavior (Prevent file from being opened)
    ev.preventDefault();
  }

  const upload = () => {
    addPost(File, account.accountId)
      .then(() => {
        toast.success("Đăng báo thành công");
        navigate("/Admin")
      })
      .catch(() => toast.error("Đăng báo thất bại"));
  };

  return (
    <div className="px-20 pt-24 min-h-screen">
      <input onChange={handleFileChange} id="inputFile" type="file" hidden />
      <div
        onDrop={dropHandler}
        onDragLeave={onDropTotal}
        onDragOver={dragOverHandler}
        onClick={() => document.getElementById("inputFile").click()}
        className="w-4/5 rounded-xl border text-neutral-500 text-xl border-neutral-100 bg-neutral-100 text-center py-20"
      >
        <div className="mb-10">{File ? File.name : content}</div>
        <Icon icon="mdi:file" className="m-auto" />
      </div>
      <div className="flex justify-end mt-10 pr-64">
        <button
          onClick={upload}
          className="px-5 py-1 text-lg transition-all rounded-3xl border text-red-600 font-light hover:font-bold"
        >
          Đăng
        </button>
      </div>
    </div>
  );
}
