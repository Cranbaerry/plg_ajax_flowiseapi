<?php

use Joomla\CMS\Extension\PluginInterface;
use Joomla\CMS\Factory;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\DI\Container;
use Joomla\DI\ServiceProviderInterface;
use Joomla\Event\DispatcherInterface;
use Joomla\Plugin\Ajax\FlowiseAPI\Extension\FlowiseAPI;

    return new class() implements ServiceProviderInterface
    {
        public function register(Container $container)
        {
            $container->set(
                PluginInterface::class,
                function (Container $container): FlowiseAPI {
    
                    $config = (array) PluginHelper::getPlugin('ajax', 'flowiseapi');
                    $subject = $container->get(DispatcherInterface::class);
                    $app = Factory::getApplication();
                    
                    $plugin = new FlowiseAPI($subject, $config);
                    $plugin->setApplication($app);
    
                    return $plugin;
                }
            );
        }
    };