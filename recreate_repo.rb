#!/usr/bin/env ruby
# frozen_string_literal: true

require 'net/http'
require 'json'
require 'uri'

def create_repo_with_personal_account
  puts "🗑️  First, please manually delete the repository at:"
  puts "   https://github.com/svc-twm-crs/repose"
  puts "   Go to Settings > Danger Zone > Delete this repository"
  puts ""
  
  print "✅ Have you deleted the repository? (y/N): "
  response = gets.chomp.downcase
  
  unless response == 'y' || response == 'yes'
    puts "❌ Please delete the repository first, then run this script again."
    exit 1
  end
  
  puts ""
  puts "📝 To create the repository under your personal account:"
  puts "1. Go to: https://github.com/new"
  puts "2. Repository name: repose"
  puts "3. Description: AI-powered GitHub repository creation and management tool written in Ruby"
  puts "4. Make it Public"
  puts "5. Don't initialize with README (we have our own)"
  puts "6. Click 'Create repository'"
  puts ""
  
  print "✅ Have you created the repository? (y/N): "
  response = gets.chomp.downcase
  
  unless response == 'y' || response == 'yes'
    puts "❌ Please create the repository first, then run this script again."
    exit 1
  end
  
  # Add the correct remote
  puts ""
  puts "🔗 Adding remote for wesleyscholl/repose..."
  
  success = system("git remote add origin https://github.com/wesleyscholl/repose.git")
  
  if success
    puts "✅ Remote added successfully!"
    
    puts "📤 Pushing to your repository..."
    push_success = system("git push -u origin main")
    
    if push_success
      puts "🎉 Repository successfully created under your account!"
      puts "🔗 https://github.com/wesleyscholl/repose"
      
      puts ""
      puts "🏷️  To add topics manually:"
      puts "1. Go to: https://github.com/wesleyscholl/repose"
      puts "2. Click the ⚙️ gear icon next to 'About'"
      puts "3. Add these topics: ruby, cli, github, automation, ai, repository-management, thor, gem"
      puts "4. Save changes"
      
    else
      puts "❌ Failed to push to repository"
    end
  else
    puts "❌ Failed to add remote"
  end
end

puts "🎯 Repose - Repository Recreation Script"
puts "=" * 50

create_repo_with_personal_account