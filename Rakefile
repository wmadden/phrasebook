namespace :ios do
    
    task :setup do
        resources = [
            'src/javascript',
            'src/stylesheets',
            'src/index.html',
            'src/images'
        ]

        sh "cp -R #{resources.join(' ')} ios/Phrasebook/www"
    end

end


namespace :android do
    
    task :setup do
        resources = [
            'src/javascript',
            'src/stylesheets',
            'src/index.html',
            'src/images'
        ]

        sh "cp -R #{resources.join(' ')} android/Phrasebook/assets/www"
    end

end
