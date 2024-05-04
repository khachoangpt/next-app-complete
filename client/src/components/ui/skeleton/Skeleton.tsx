import type { HTMLAttributes } from 'react'

import { cn } from '@/lib/utils'

import { Container } from '../container'

function Skeleton({
  className,
  ...props
}: Readonly<HTMLAttributes<HTMLDivElement>>) {
  return (
    <Container
      className={cn('rounded-medium bg-muted animate-pulse', className)}
      {...props}
    />
  )
}

export { Skeleton }
