import React, { useCallback, useEffect, useState } from "react";
import { Table, userManagerHeader } from "../../components/Table";
import { getApi, putApi } from "../../api/service";
import { banUser, getUsers } from "../../api/api";

export default function UserManager() {
  const [users, setUsers] = useState([]);

  const getUser = useCallback(() => {
    getApi(getUsers).then((result) => setUsers(result));
  })

  const changeUserStatus = useCallback((id) => {
    putApi(banUser,{}, id).then(() => {
      getUser()
    })
  })
  useEffect(() => {
    getUser()
  }, []);
  return (
    <div className="pt-40 px-20">
      <Table statusFunction={changeUserStatus} headers={userManagerHeader} datas={users}></Table>
    </div>
  );
}
