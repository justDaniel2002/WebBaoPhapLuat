import { hashPassword } from "../helpers/helper";
import PrismaService from "./prisma";

const prisma = PrismaService.getInstance();

export const register = async (email: string, password: string) => {
  await prisma.account.create({
    data: {
      email,
      password: hashPassword(password),
      roleId: 3,
    },
  });
};

export const login = async (email: string, password: string) => {
  const account = await prisma.account.findFirst({
    where: {
      email,
      password: hashPassword(password),
    },
    select: {
      accountId: true,
      email: true,
      facebookId: true,
      facebookURL: true,
      roleId: true,
      createdDate: true,
      status: true,
      FavoritePost: {
        include: {
          Post: true,
        },
      },
    },
  });
  return account;
};

export const banUserHandle = async (accountId: number) => {
  const account = await prisma.account.findUnique({ where: { accountId } });
  try {
    await prisma.account.update({
      data: {
        status: !account?.status,
      },
      where: { accountId },
    });
  } catch (error) {
    console.log(error)
  }
};

export const getAllUser = async() => {
    const users = await prisma.account.findMany({where:{roleId:3}})
    return users;
}
