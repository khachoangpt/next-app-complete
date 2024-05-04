import { Select } from '@/components/common/select'
import { Container } from '@/components/ui/container'

export default function Home() {
  return (
    <main>
      <Container className="m-auto flex max-w-lg justify-center pt-10">
        <Select
          options={[
            { value: '1', label: 'Option 1' },
            { value: '2', label: 'Option 2' },
          ]}
        />
      </Container>
    </main>
  )
}
