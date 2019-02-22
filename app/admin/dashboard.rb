ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
      end
    end

    columns do
      column do
        panel "Recent Heros" do
          ul do
            Hero.order(created_at: :desc).limit(5).map do |hero|
              li link_to(hero.name, admin_hero_path(hero))
            end
          end
        end
      end

      column do
        panel "Recent Abilities" do
          ul do
            Ability.order(created_at: :desc).limit(5).map do |ability|
              li link_to(ability.name, admin_ability_path(ability))
            end
          end
        end
      end

      column do
        panel "Recent Registered Hero Abilities" do
          ul do
            AbilityHero.all.limit(5).map do |record|
              li span "#{record.ability.name} | #{record.hero.name}"
            end
          end
        end
      end
    end
  end
end
