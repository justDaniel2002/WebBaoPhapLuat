import { formatDate } from "../helpers/helpers";

export const userManagerHeader = [
  {
    content: "Email",
    id: "email",
    width: "w-4/12",
  },
  {
    content: "Ngày lập tài khoản",
    id: "createdDate",
    width: "w-2/12",
    format: (data) => formatDate(data?.createdDate)
  },
  {
    content: "Vai trò",
    id: "roleId",
    format: (data) => "Người dùng",
    width: "w-2/12",
  },
  {
    content: "Tình trạng",
    id: "status",
    width: "w-2/12",
    format: (data) => (
      <>
        {data?.status ? (
          <span className="flex items-center ">
            <span class="relative flex h-3 w-3 mr-2">
              <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-green-400 opacity-75"></span>
              <span class="relative inline-flex rounded-full h-3 w-3 bg-green-500"></span>
            </span>
            <span>Đang hoạt động</span>
          </span>
        ) : (
          <span className="flex items-center">
            <span class="relative flex h-3 w-3 mr-2">
              <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-red-400 opacity-75"></span>
              <span class="relative inline-flex rounded-full h-3 w-3 bg-red-500"></span>
            </span>
            <span>Ngừng hoạt động</span>
          </span>
        )}
      </>
    ),
  },
];

export const commentManagerHeader = [
  {
    content:"Nội dung",
    id:"content",
    width:"w-2/6",
    format:(data) => <div className="">{data?.content}</div>
  },
  {
    content:"Ngày tạo",
    id:"createdDate",
    width:"w-1/6",
    format:(data) => <div>{formatDate(data?.createdDate)}</div>
  },
  {
    content:"Người tạo",
    id:"accountId",
    width:"w-1/6",
    format:(data) => <div>{data?.Account?.email}</div>
  },
  {
    content:"Bài viết",
    id:"postId",
    width:"w-2/6",
    format:(data) => <div className="">{data?.Post?.title}</div>
  }
]

export const Table = ({ headers, datas, ActionTd=undefined }) => (
  <table>
    <thead>
      <tr className="bg-slate-300">
        <th className="px-2">#</th>
        {headers.map((head) => (
          <th className={`${head.width} py-2`}>{head.content}</th>
        ))}
        {ActionTd&&<th></th>}
      </tr>
    </thead>
    <tbody className="text-sm">
      {datas.map((data, index) => (
        <tr>
          <td className="px-2 border">{index + 1}</td>
          {headers.map((head) => (
            <td className={`px-3 py-3 border ${head.width}`}>{head?.format ? head.format(data) : data[head.id]}</td>
          ))}
          {ActionTd&&<ActionTd data={data}/>}
        </tr>
      ))}
    </tbody>
  </table>
);
