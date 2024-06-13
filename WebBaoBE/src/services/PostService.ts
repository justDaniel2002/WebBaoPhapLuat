import { Post, PostView } from "@prisma/client";
import PrismaService from "./prisma";
import xlsx from "xlsx";
import fs from "fs";

const prisma = PrismaService.getInstance();

export const getAllPost = async () => {
  const posts = await prisma.post.findMany({
    include:{
      PostView: true,
      Comment: true
    }
  });
  return posts;
};

export const getPostById = async (id: number) => {
  const posts = await prisma.post.findUnique({
    where: {
      postId: id,
    },
    include: {
      Category: true,
      Tag: {
        include:{
          InnerTag: true,
        }
      },
      PostView: true,
    },
  });
  return posts;
};

export const readFileExcelPost = async (excelFile: string) => {
  const workbook = xlsx.readFile(excelFile);
  const sheetName = workbook.SheetNames[0];
  const sheet = workbook.Sheets[sheetName];

  // Parse the data
  const posts: Post[] = xlsx.utils.sheet_to_json(sheet, { raw: false });

  fs.unlinkSync(excelFile);
  return posts;
};

export const addManyPosts = async (posts: Post[]) => {
  await prisma.post.createMany({
    data: posts,
  });
};

export const addPost = async (post: any) => {
  try {
    await prisma.post.create({
      data: {
        title: post.title,
        imageURL: post.imageURL,
        content: post.content,
        createdDate: post.createdDate,
        description: post.description,
        categoryId: post.categoryId,
        tagId: post?.tagId??1,
        innerTagId: post?.innerTagId??1,
        createdBy: post?.createdBy??1
      },
    });
  } catch (error) {
    console.log(error)
  }
};

export const editPost = async (post: any, id: number) => {
  try {
    await prisma.post.update({
      where: {
        postId: id,
      },
      data: {
        title: post.title,
        imageURL: post.imageURL,
        content: post.content,
        createdDate: post.createdDate,
        description: post.description,
        categoryId: post.categoryId,
        tagId: post?.tagId??1,
        innerTagId: post?.innerTagId??1
      },
    });
  } catch (error) {
    console.log(error)
  }
};

export const deletePost = async (id: number) => {
  
  try {
    // await prisma.postTag.deleteMany({
    //   where:{
    //     postId: id
    //   }
    // })
    await prisma.comment.deleteMany({
      where:{
        postId: id
      }
    })
    await prisma.post.delete({
      where: {
        postId: id,
      },
    });
  } catch (error) {
    console.log(error)
  }
};

export const getPostsByInnerTag = async (innerTagId:number) => {
  const posts = await prisma.post.findMany({
    where:{
      innerTagId
    },
    include:{
      Category: true,
      Tag: true,
      InnerTag: true,
    }
  });

  return posts;
};

export const getPostByCategory = async (categoryId: number) => {
  const posts = await prisma.post.findMany({
    where: {
      categoryId,
    },
    include:{
      Category: true,
      Tag: true,
      InnerTag: true,
    }
  });
  return posts;
};

export const getPostByTag = async (tagId: number) => {
  const posts = await prisma.post.findMany({
    where:{
      tagId
    },
    include:{
      Category: true,
      Tag: true,
      InnerTag: true,
    }
  });

  return posts;
};

export const getPostByTitle = async (title: string) => {
  let posts = await prisma.post.findMany();
  posts = posts.filter((p) => p.title?.includes(title));
  return posts;
};

export const getPostByAccountId = async (id: number) => {
  const posts = await prisma.post.findMany({
    where: {
      createdBy: id,
    },
  });
  return posts;
};

export const addViewPost = async (view: PostView) => {
  await prisma.postView.create({
    data: view
  })
}
