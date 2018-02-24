use_frameworks!
inhibit_all_warnings!
platform :ios, '11.0'

def swift_pods
    pod 'IDPCastable', '~>0.1.3'
    pod 'SnapKit', '~>4.0.0'
end

def git_pods
    pod 'IDPRootViewGettable', git: 'https://github.com/idapgroup/IDPRootViewGettable.git'
end

def pods
    swift_pods
    git_pods
end

def bdd_pods
    pod 'Nimble', '~>7.0.0'
    pod 'Quick', '~>1.2.0'
end

def test_pods
    pods
    bdd_pods
end

target 'Lib' do
    pods
end

target 'LibTests' do
    bdd_pods
end
