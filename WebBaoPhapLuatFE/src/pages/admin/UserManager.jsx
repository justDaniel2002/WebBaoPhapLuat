import React, { useCallback, useEffect, useMemo, useState } from "react";
import { Table, userManagerHeader } from "../../components/Table";
import { getApi, putApi } from "../../api/service";
import { banUser, getUsers } from "../../api/api";
import { toast } from "react-toastify";

export default function UserManager() {
  const [users, setUsers] = useState([]);
  const [search, setSearch] = useState("")

  const getUser = useCallback(() => {
    getApi(getUsers).then((result) => setUsers(result));
  },[]);

  const changeUserStatus = useCallback((id) => {
    putApi(banUser, {}, id).then(() => {
      getUser();
    });
  },[]);

  const ActionTd = useCallback(({ data={} }) => (
    <td className="px-2 min-w-20 border">
      <button
        onClick={() => {
          changeUserStatus(data?.accountId)
          toast.success("Đã thay đổi trạng thái người dùng")
        }}
        className={`${
          data?.status ? "bg-red-500" : "bg-green-500"
        } text-white px-3 py-2 rounded-xl`}
      >
        {data?.status ? "De-active" : "Active"}
      </button>
    </td>
  ), [users])

  useEffect(() => {
    getUser();
  }, []);
  return (
    <div className="pt-40 px-20">
      <div className="">
        <input placeholder="Email người dùng" value={search} onChange={(event) => setSearch(event.target.value)} className="my-5 border border-neutral-500 rounded-md px-3 py-1 w-2/6"/>
      </div>
      <Table
        ActionTd={ActionTd}
        headers={userManagerHeader}
        datas={users.filter(user => user?.email?.includes(search))}
      ></Table>
    </div>
  );
}
