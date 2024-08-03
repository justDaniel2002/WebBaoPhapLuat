import React, { useEffect, useRef, useState } from "react";
import { getApi } from "../../api/service";
import { getStaticInfo, getView } from "../../api/api";
import { formatDateToDDMM, getMillisecondsAgo, getMonthFromDate, gettDayFormattedDDMM } from "../../helpers/helpers";
import { AChart } from "../../components/AreaChart";

export default function Dashboard() {
  const [time, setTime] = useState("year");
  const [views, setViews] = useState();
  const [staticInf, setStatic] = useState();

  const parentRef = useRef(null);

  useEffect(() => {
    getApi(getStaticInfo).then((res) => setStatic(res));

    getApi(`${getView}/${time}`).then((res) => {
      let staticView = initView();
      res.forEach((e) => {
        const month = time=="year"?getMonthFromDate(e.viewDate):formatDateToDDMM(e.viewDate);
        const monthData = staticView.find((v) => v.name == month);
        if (monthData) {
          const updateData = staticView.map((item) => {
            if (item.name == month) {
              return {
                ...item,
                views: item.views + 1,
              };
            }
            return item;
          });
          staticView = updateData;
        } else {
          staticView = [...staticView, { name: month, views: 1 }];
        }
      });
      console.log("staticview", staticView);
      setViews(staticView);
    });
  }, [time]);

  const initView = () => {
    if (time == "year")
      return [
        {
          name: "Tháng 1",
          views: 0,
        },
        {
          name: "Tháng 2",
          views: 0,
        },
        {
          name: "Tháng 3",
          views: 0,
        },
        {
          name: "Tháng 4",
          views: 0,
        },
        {
          name: "Tháng 5",
          views: 0,
        },
        {
          name: "Tháng 6",
          views: 0,
        },
        {
          name: "Tháng 7",
          views: 0,
        },
        {
          name: "Tháng 8",
          views: 0,
        },
        {
          name: "Tháng 9",
          views: 0,
        },
        {
          name: "Tháng 10",
          views: 0,
        },
        {
          name: "Tháng 11",
          views: 0,
        },
        {
          name: "Tháng 12",
          views: 0,
        },
      ];
    else if (time == "days")
      return [
        {
          name: gettDayFormattedDDMM(getMillisecondsAgo(1)),
          views: 0,
        },
        {
          name: gettDayFormattedDDMM(getMillisecondsAgo(2)),
          views: 0,
        },
        {
          name: gettDayFormattedDDMM(getMillisecondsAgo(3)),
          views: 0,
        },
        {
          name: gettDayFormattedDDMM(getMillisecondsAgo(4)),
          views: 0,
        },
        {
          name: gettDayFormattedDDMM(getMillisecondsAgo(5)),
          views: 0,
        },
        {
          name: gettDayFormattedDDMM(getMillisecondsAgo(6)),
          views: 0,
        },
        {
          name: gettDayFormattedDDMM(getMillisecondsAgo(7)),
          views: 0,
        },
      ];
    return [];
  };
  return (
    <div ref={parentRef} className="pt-20 px-10">
      <div className="flex justify-around mb-20 font-medium text-white">
        <div className="w-1/4 px-5">
          <div className="px-10 py-10 rounded-md border bg-slate-500">
            <div>
              Bài viết: {staticInf?.posts}
              <hr className="my-5" />
              <div>Bài viết đã duyệt: {staticInf?.browsedPosts}</div>
              <div>
                Bài viết chưa duyệt:{" "}
                {staticInf?.posts - staticInf?.browsedPosts}
              </div>
            </div>
          </div>
        </div>

        <div className="w-1/4 px-5">
          <div className="px-10 py-10 rounded-md border bg-slate-500">
            <div>Tài khoản: {staticInf?.accounts}</div>
            <hr className="my-5" />
            <div>Người dùng: {staticInf?.users}</div>
            <div>
              Người thuộc quản lý: {staticInf?.accounts - staticInf?.users}
            </div>
          </div>
        </div>

        <div className="w-1/4 px-5">
          <div className="px-10 py-10 rounded-md border bg-slate-500">
            <div>Comment: {staticInf?.comments}</div>
            <hr className="my-5" />
          </div>
        </div>

        <div className="w-1/4 px-5">
          <div className="px-10 py-10 rounded-md border bg-slate-500">
            <div>
              Lượt xem: {staticInf?.views}
              <hr className="my-5" />
            </div>
          </div>
        </div>
      </div>
      <div className="flex justify-end">
        <select onChange={(event) => setTime(event.target.value)} value={time} className="border rounded-md px-5 py-1">
          <option value={"days"}>7 days</option>
          <option value={"month"}>30 days</option>
          <option value={"year"}>12 month</option>
        </select>
      </div>
      <AChart
        data={views}
        width={
          parentRef?.current?.offsetWidth - parentRef?.current?.offsetWidth / 5
        }
        height={
          parentRef?.current?.offsetHeight -
          parentRef?.current?.offsetHeight / 2
        }
      />
    </div>
  );
}
