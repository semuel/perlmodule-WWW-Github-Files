use ExtUtils::MakeMaker;
 
WriteMakefile(
    NAME          => 'WWW::Github::Files',
    VERSION_FROM  => 'lib/WWW/Github/Files.pm',
    ABSTRACT_FROM => 'lib/WWW/Github/Files.pm',
    AUTHOR        => 'Shmuel Fomberg <shmuelfomberg@gmail.com>',
    PREREQ_PM     => {  
        'LWP::Protocol::https' => 0,
        'LWP::UserAgent' => '6.04',
    },
);
