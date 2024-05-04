import type { PageMeta } from '@/types/routes.types'

export const pageList = {
  home: {
    title: 'Home',
    href: '/',
    isAuth: false,
    pattern: [''],
  },
}

export const pathList: PageMeta[] = Object.values(pageList)
