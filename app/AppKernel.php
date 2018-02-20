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

use SevenTag\Api\AppBundle\Kernel\Kernel;

/**
 * Class AppKernel
 */
class AppKernel extends Kernel
{

  /**
   * {@inheritdoc}
   */
    public function registerBundles()
    {
        $bundles = [
        ];
        return array_merge(
            parent::registerBundles(),
            $bundles,
            $this->registerPluginBundles(__DIR__ . '/../src/SevenTag/Plugin')
        );
    }

    public function getCacheDir()
    {
        return $this->rootDir . '/../var/cache/' . $this->environment;
    }

    public function getLogDir()
    {
        return $this->rootDir . '/../var/logs';
    }
}
