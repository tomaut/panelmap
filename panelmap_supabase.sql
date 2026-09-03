-- PanelMap: banco compartilhado para GitHub Pages + Supabase
create table if not exists public.panelmap_state (
  id text primary key,
  components jsonb not null default '[]'::jsonb,
  history jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.panelmap_state enable row level security;

drop policy if exists "PanelMap authenticated read" on public.panelmap_state;
drop policy if exists "PanelMap authenticated insert" on public.panelmap_state;
drop policy if exists "PanelMap authenticated update" on public.panelmap_state;

create policy "PanelMap authenticated read"
  on public.panelmap_state for select
  to authenticated using (true);

create policy "PanelMap authenticated insert"
  on public.panelmap_state for insert
  to authenticated with check (true);

create policy "PanelMap authenticated update"
  on public.panelmap_state for update
  to authenticated using (true) with check (true);

grant select, insert, update on public.panelmap_state to authenticated;
