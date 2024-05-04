'use client'

import * as SelectPrimitive from '@radix-ui/react-select'
import type { VariantProps } from 'class-variance-authority'
import { Check, ChevronDown, ChevronUp } from 'lucide-react'
import {
  type ComponentPropsWithoutRef,
  type ElementRef,
  forwardRef,
} from 'react'

import { cn } from '@/lib/utils'

import { ScrollArea } from '../scroll-area'
import { Text } from '../text'
import {
  selectContentVariants,
  selectItemVariants,
  selectVariants,
} from './variants'

const SelectBase = SelectPrimitive.Root

const SelectGroup = SelectPrimitive.Group

const SelectValue = SelectPrimitive.Value

const SelectTrigger = forwardRef<
  ElementRef<typeof SelectPrimitive.Trigger>,
  ComponentPropsWithoutRef<typeof SelectPrimitive.Trigger> &
    VariantProps<typeof selectVariants>
>(({ className, children, variant, ...props }, ref) => (
  <SelectPrimitive.Trigger
    ref={ref}
    className={cn(selectVariants({ variant }), className)}
    {...props}
  >
    {children}
    <SelectPrimitive.Icon asChild>
      <ChevronDown className="h-4 w-4 opacity-50" />
    </SelectPrimitive.Icon>
  </SelectPrimitive.Trigger>
))
SelectTrigger.displayName = SelectPrimitive.Trigger.displayName

const SelectScrollUpButton = forwardRef<
  ElementRef<typeof SelectPrimitive.ScrollUpButton>,
  ComponentPropsWithoutRef<typeof SelectPrimitive.ScrollUpButton>
>(({ className, ...props }, ref) => (
  <SelectPrimitive.ScrollUpButton
    ref={ref}
    className={cn(
      'flex cursor-default items-center justify-center py-1',
      className,
    )}
    {...props}
  >
    <ChevronUp className="h-4 w-4" />
  </SelectPrimitive.ScrollUpButton>
))
SelectScrollUpButton.displayName = SelectPrimitive.ScrollUpButton.displayName

const SelectScrollDownButton = forwardRef<
  ElementRef<typeof SelectPrimitive.ScrollDownButton>,
  ComponentPropsWithoutRef<typeof SelectPrimitive.ScrollDownButton>
>(({ className, ...props }, ref) => (
  <SelectPrimitive.ScrollDownButton
    ref={ref}
    className={cn(
      'flex cursor-default items-center justify-center py-1',
      className,
    )}
    {...props}
  >
    <ChevronDown className="h-4 w-4" />
  </SelectPrimitive.ScrollDownButton>
))
SelectScrollDownButton.displayName =
  SelectPrimitive.ScrollDownButton.displayName

const SelectContent = forwardRef<
  ElementRef<typeof SelectPrimitive.Content>,
  ComponentPropsWithoutRef<typeof SelectPrimitive.Content> &
    VariantProps<typeof selectContentVariants>
>(({ className, children, position = 'popper', variant, ...props }, ref) => {
  return (
    <SelectPrimitive.Portal>
      <SelectPrimitive.Content
        ref={ref}
        className={cn(
          position === 'popper' &&
            'data-[side=bottom]:translate-y-1 data-[side=left]:-translate-x-1 data-[side=right]:translate-x-1 data-[side=top]:-translate-y-1',
          selectContentVariants({ variant }),
          className,
        )}
        position={position}
        {...props}
      >
        <ScrollArea>
          <SelectPrimitive.Viewport className={cn('p-1')}>
            {children}
          </SelectPrimitive.Viewport>
        </ScrollArea>
      </SelectPrimitive.Content>
    </SelectPrimitive.Portal>
  )
})
SelectContent.displayName = SelectPrimitive.Content.displayName

const SelectLabel = forwardRef<
  ElementRef<typeof SelectPrimitive.Label>,
  ComponentPropsWithoutRef<typeof SelectPrimitive.Label>
>(({ className, ...props }, ref) => (
  <SelectPrimitive.Label
    ref={ref}
    className={cn('py-1.5 pl-8 pr-2 text-sm font-semibold', className)}
    {...props}
  />
))
SelectLabel.displayName = SelectPrimitive.Label.displayName

const SelectItem = forwardRef<
  ElementRef<typeof SelectPrimitive.Item>,
  ComponentPropsWithoutRef<typeof SelectPrimitive.Item> &
    VariantProps<typeof selectItemVariants>
>(({ className, children, variant, ...props }, ref) => (
  <SelectPrimitive.Item
    ref={ref}
    className={cn(selectItemVariants({ variant }), className)}
    {...props}
  >
    <Text
      as="span"
      className="absolute left-2 flex h-3.5 w-3.5 items-center justify-center"
    >
      <SelectPrimitive.ItemIndicator>
        <Check className="h-4 w-4" />
      </SelectPrimitive.ItemIndicator>
    </Text>

    <SelectPrimitive.ItemText>{children}</SelectPrimitive.ItemText>
  </SelectPrimitive.Item>
))
SelectItem.displayName = SelectPrimitive.Item.displayName

const SelectSeparator = forwardRef<
  ElementRef<typeof SelectPrimitive.Separator>,
  ComponentPropsWithoutRef<typeof SelectPrimitive.Separator>
>(({ className, ...props }, ref) => (
  <SelectPrimitive.Separator
    ref={ref}
    className={cn('bg-muted -mx-1 my-1 h-px', className)}
    {...props}
  />
))
SelectSeparator.displayName = SelectPrimitive.Separator.displayName

export {
  SelectBase,
  SelectContent,
  SelectGroup,
  SelectItem,
  SelectLabel,
  SelectScrollDownButton,
  SelectScrollUpButton,
  SelectSeparator,
  SelectTrigger,
  SelectValue,
}