import { Post } from "@prisma/client";
import PrismaService from "./prisma";
import xlsx from "xlsx";
import fs from "fs";

const prisma = PrismaService.getInstance();

export const getAllPost = async () => {
  const posts = await prisma.post.findMany();
  return posts;
};

export const getPostById = async (id: number) => {
  const posts = await prisma.post.findUnique({
    where: {
      postId: id,
    },
    include: {
      Category: true,
      PostTag: true,
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

export const editPost = async (post: Post, id: number) => {
  await prisma.post.update({
    where: {
      postId: id,
    },
    data: {
      ...post,
    },
  });
};

export const deletePost = async (id: number) => {
  await prisma.post.delete({
    where: {
      postId: id,
    },
  });
};

export const addTagToPost = async (tags: number[], postId: number) => {
  await prisma.postTag.deleteMany({
    where:{
      postId
    }
  })
  await prisma.postTag.createMany({
    data: tags.map((tag) => {
      return { tagId: tag, postId };
    }),
  });
};

export const getPostByCategory = async (categoryId: number) => {
  const posts = await prisma.post.findMany({
    where: {
      categoryId,
    },
  });
  return posts;
};

export const getPostByTag = async (tagId: number) => {
  const posts = await prisma.post.findMany({
    include: {
      PostTag: {
        where: {
          tagId,
        },
      },
    },
  });

  return posts;
};

export const getPostByTitle = async (title: string) => {
  let posts = await prisma.post.findMany();
  posts = posts.filter((p) => p.title?.includes(title));
  return posts;
};

export const getPostByAccountId = async (id:number) => {
  const posts = await prisma.post.findMany({
    where:{
      createdBy: id
    }
  })
  return posts;
}