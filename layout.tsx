import type { Metadata } from 'next';
import './globals.css';

export const metadata: Metadata = {
  title: 'Kèspam — Gestion financière personnelle',
  description: 'Gérez vos revenus, dépenses, budgets et dettes simplement.',
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="fr"><body>{children}</body></html>;
}
