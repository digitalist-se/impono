<?php
/**
 * Copyright (C) 2015 Digimedia Sp. z o.o. d/b/a Clearcode
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option) any
 * later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

namespace SevenTag\Updater\Utils;

use SevenTag\Updater\Environment\EnvironmentInterface;
use Symfony\Component\Yaml\Parser;
use Symfony\Component\Filesystem\Exception\FileNotFoundException;

/**
 * Class DomainProvider
 * @package SevenTag\Updater\Utils
 */
class DomainProvider implements DomainProviderInterface
{
    /**
     * @var EnvironmentInterface
     */
    private $environment;

    /**
     * @param EnvironmentInterface $environment
     */
    public function __construct(EnvironmentInterface $environment)
    {
        $this->environment = $environment;
    }

    /**
     * {@inheritdoc}
     */
    public function getDomain()
    {
        if ($this->isSSL()) {
            $protocol = 'https://';
        } else {
            $protocol = 'http://';
        }

        $domain = $protocol . 'localhost';
        if (isset($_SERVER['HTTP_HOST'])) {
            $domain = $protocol . $_SERVER['HTTP_HOST'];
        }
        if (isset($_SERVER['HTTP_X_FORWARDED_HOST'])) {
            $domain = $protocol . $_SERVER['HTTP_X_FORWARDED_HOST'];
        }
        $filesystem = $this->environment->getCurrentInstance()
            ->getFilesystem();

        $parameters = [];



        if ($filesystem->has('app/config/parameters.yml')) {
            try {
                $yaml = new Parser();
                $parameters = $yaml->parse($filesystem->read('app/config/parameters.yml'));
                if (isset($parameters['parameters']['seventag_domain'])) {
                    $domain = $parameters['parameters']['seventag_domain'];
                }
            } catch (FileNotFoundException $e) {
                echo "parameters.yml could not be read";
                echo $e->getMessage();
            }
        }
        return $domain;
    }

    /**
     * Check if we are on SSL
     *
     * @return bool
     *
     */
    public function isSSL()
    {
        if (!empty($_SERVER['https'])) {
            return true;
        }

        if (!empty($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') {
            return true;
        }
        return false;
    }
}
