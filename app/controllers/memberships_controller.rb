class MembershipsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new

  end

  def create

    customer = current_user.stripe_customer

    begin

      subscription = customer.subscriptions.create(
        source: params[:stripe_card_token], 
        plan: params[:plan]
      )
      current_user.assign_attributes(stripe_subscription_id: subscription.id, expires_at: nil)
      current_user.assign_attributes(
        card_brand: params[:user][:card_brand],
        card_last4: params[:user][:card_last4],
        card_exp_month: params[:user][:card_exp_month],
        card_exp_year: params[:user][:card_exp_year]
      ) if params[:card_last4]
      current_user.update(plan_id: params[:plan])
      current_user.save
      MembershipMailer.subscribe_membership(current_user).deliver

      flash.notice = t('message_subscribed')
      redirect_to root_path
    rescue Stripe::CardError => e
      flash.alert = e.message
      render action: :new
    end
  end

  def show
  end

  def edit

  end

  def update
    customer = current_user.stripe_customer

    begin
      source = customer.sources.create(source: params[:user][:stripe_card_token])

      customer.default_source = source.id
      customer.save

      current_user.assign_attributes(
        card_brand: params[:user][:card_brand],
        card_last4: params[:user][:card_last4],
        card_exp_month: params[:user][:card_exp_month],
        card_exp_year: params[:user][:card_exp_year]
      )
      current_user.save

      flash.notice = t('card_updated_message')
      redirect_to root_path

    rescue Stripe::CardError => e
      flash.alert = e.message
      render action: :show
    end
  end

  def destroy
    customer = current_user.stripe_customer
    subscription = customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete

    expires_at = (Time.zone.at(subscription.current_period_end) + 7776000)
    current_user.update(expires_at: expires_at, stripe_subscription_id: nil)
    MembershipMailer.destroy_membership(current_user).deliver

    redirect_to root_path, notice: t('cancel_message') + "#{current_user.expires_at.to_date}."
  end
end